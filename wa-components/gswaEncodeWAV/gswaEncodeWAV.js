"use strict";

class gswaEncodeWAV {
	static encode( buffer, opt ) {
		const nbChannels = buffer.numberOfChannels,
			sampleRate = buffer.sampleRate,
			format = opt && opt.float32 ? 3 : 1,
			bitsPerSample = format === 3 ? 32 : 16,
			bytesPerSample = bitsPerSample / 8,
			bytesPerbloc = nbChannels * bytesPerSample,
			samples = nbChannels === 2
				? gswaEncodeWAV._interleave( buffer.getChannelData( 0 ), buffer.getChannelData( 1 ) )
				: buffer.getChannelData( 0 ),
			dataSize = samples.length * bytesPerSample,
			arrBuffer = new ArrayBuffer( 44 + dataSize ),
			data = new DataView( arrBuffer );

		gswaEncodeWAV._setString( data, 0, "RIFF" );           
		data.setUint32( 4, 36 + dataSize, true );              
		gswaEncodeWAV._setString( data, 8, "WAVE" );           
		gswaEncodeWAV._setString( data, 12, "fmt " );          
		data.setUint32( 16, 16, true );                        
		data.setUint16( 20, format, true );                    
		data.setUint16( 22, nbChannels, true );                
		data.setUint32( 24, sampleRate, true );                
		data.setUint32( 28, sampleRate * bytesPerbloc, true ); 
		data.setUint16( 32, bytesPerbloc, true );              
		data.setUint16( 34, bitsPerSample, true );             
		gswaEncodeWAV._setString( data, 36, "data" );          
		data.setUint32( 40, dataSize, true );                  

		( format === 1
			? gswaEncodeWAV._bufToInt16
			: gswaEncodeWAV._bufToFloat32
		)( data, 44, samples );
		return arrBuffer;
	}

	// private:
	static _interleave( ldata, rdata ) {
		const len = ldata.length + rdata.length,
			arr = new Float32Array( len );

		for ( let i = 0, j = 0; i < len; ++j ) {
			arr[ i++ ] = ldata[ j ];
			arr[ i++ ] = rdata[ j ];
		}
		return arr;
	}
	static _setString( data, offset, str ) {
		for ( let i = 0; i < str.length; ++i ) {
			data.setUint8( offset + i, str.charCodeAt( i ) );
		}
	}
	static _bufToInt16( data, offset, samples ) {
		for ( let i = 0; i < samples.length; ++i, offset += 2 ) {
			const s = Math.max( -1, Math.min( samples[ i ], 1 ) );

			data.setInt16( offset, s < 0 ? s * 0x8000 : s * 0x7FFF, true );
		}
	}
	static _bufToFloat32( data, offset, samples ) {
		for ( let i = 0; i < samples.length; ++i, offset += 4 ) {
			data.setFloat32( offset, samples[ i ], true );
		}
	}
}
