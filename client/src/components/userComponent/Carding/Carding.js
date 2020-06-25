import React from "react";
import { useHistory } from "react-router-dom";
import "./CardMovie.css";
import playIcon from '../../../images/videothumbnail/iconplay.png';


const Carding = ({ music: { id, title, year, thumbnail, artist: { name } }, setPlayIndex,
  index,
  playIndex }) => {
  console.log(index)
  return (
    <div >

      <div className='music-card playing'>

        <div className='image'>
          <img
            src={`http://localhost:5000/uploads/${thumbnail}`}
            onClick={() => setPlayIndex(index)}
            style={{ width: 180, height: 120 }}
          />
        </div>

        <div className='wave'></div>
        <div className='wave'></div>
        <div className='wave'></div>

        <div className='info'>
          <h2 className='title'>{title}</h2>
          <div className='artist'>{name}</div>
        </div>

        <i className="fa fa-pause trigger" aria-hidden="true"></i>
        <i className="fa fa-play trigger" aria-hidden="true"></i>
      </div>

    </div>
  );
};

export default Carding;
