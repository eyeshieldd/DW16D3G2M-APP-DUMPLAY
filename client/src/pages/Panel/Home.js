import React, { useEffect, useState } from "react";
import CardBackgorund from "../../components/userComponent/CardBackgorund/CardBackgorund";
import Grid from "../../components/userComponent/GridComponent/Grid";
import { image1 } from "../../dummyData/imagedetail";
import 'react-toastify/dist/ReactToastify.css';
import { connect } from "react-redux";
import { getSong } from "../../redux/actions/song";
import PropTypes from "prop-types";
import ReactJkMusicPlayer from "react-jinke-music-player";
import "react-jinke-music-player/assets/index.css";
import PlayerDom from '../../components/userComponent/Player/Player';


const Home = ({
  getSong,
  auth: { isAuthenticated, user },
  song: { singSong, loading }

}) => {
  const [playIndex, setPlayIndex] = useState(0);

  useEffect(
    () => {
      getSong(12);
    },
    [getSong]
  );

  console.log(singSong)
  return loading ? (
    <div>
    </div>
  ) : (
      <div>

        <CardBackgorund images={image1} />
        <Grid title="Music" song={singSong}
          setPlayIndex={setPlayIndex}
          playIndex={playIndex}
        />
        {user === null ? null : (isAuthenticated && user.subscribe) ||
          (isAuthenticated && user.role === 1) ? (
            <PlayerDom
              song={singSong}
              playIndex={playIndex}
              setPlayIndex={setPlayIndex}
            />

          ) : null}

      </div>
    );
};

Home.propTypes = {
  song: PropTypes.object.isRequired
};

const mapStateToProps = (state) => ({
  song: state.song,
  auth: state.auth

});

export default connect(mapStateToProps, { getSong })(Home);
