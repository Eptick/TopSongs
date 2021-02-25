import React from 'react';
import convertToMMSS from './utils/convertToMMSS';

/**
  1. redni broj pjesme na listi
  2. naziv pjesme
  3. ime glazbenika
  4. trajanje pjesme u formatu “mm:ss”
  5. close button koji zatvara modal
 */
export default function({
  closeModal,
  index,
  artist,
  title,
  duration,
  album,
}) {

  return (
    <div className="modal-window" onClick={closeModal}>
      <div className="modal hvr-underline-from-left" onClick={e => e.stopPropagation()}>
        <div className="btn-close" onClick={closeModal}>X</div>
        <h2><span className="position">{index + 1}.</span> {title} ({convertToMMSS(duration)})</h2>
        <small>{artist.name}</small>
        <div className="album">
          <img src={album.cover_big} alt={album.title}/> 
          <p href={album.tracklist}>{album.title}</p>
        </div>
      </div>
    </div>
  )
}
