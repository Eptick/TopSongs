import React, { useEffect, useState, useCallback } from 'react';
import Api from './services/Api';
import getRequestStatus from './constants/getRequestStatus';
import SORT_BY from './constants/SORT_BY';
import TrackModal from './TrackModal';
import convertToMMSS from './utils/convertToMMSS';

// A animated loader component
function Loader()  {
  return <div className="lds-toppop"><div></div><div></div><div></div></div>
}

// Component to display an error when it occurs
function Error()  {
  return <div className="error">
    <img src="/error.png" alt="error" />
    <h3>Oops</h3>
  </div>
}

function App() {

  const [requestStatus, setRequestStatus] = useState(getRequestStatus())
  const [topTenList, setTopTenList] = useState([])
  const [sortBy, setSortBy] = useState(SORT_BY.ASC)
  const [selectedSong, setSelectedSong] = useState(null);

  const updateList = useCallback((data, order) => {
    if(!order) order = sortBy
    setTopTenList(data.sort((a, b) => order === SORT_BY.ASC ? a.duration - b.duration : b.duration - a.duration))
  }, [sortBy])

  const changeSortBy = useCallback((data) => {
    setSortBy(data)
    updateList(topTenList, data);
  }, [topTenList, updateList])

  const closeModal = useCallback(() => {
    setSelectedSong(null)
  }, [])

  // on the applicaiton load, fetch the currently top 10 tracks on Deezer
  useEffect(() => {
    Api.getTracks().then(resp => {
      setRequestStatus(getRequestStatus(false, true, false))
      updateList(resp.data)
    }).catch(() => {
      setRequestStatus(getRequestStatus(false, true, true))
    })
    // eslint-disable-next-line
  }, [])

  return (
    <div className="app">
      <div className="pink-stripe" />
      <div className="title-header">
        <h2>Top 10 most listened songs</h2>
        <p>today</p>
      </div>
      <div className="content">
        <div className="filter">
          <select onChange={ elem => changeSortBy(elem.target.value)} defaultValue={sortBy}>
            <option value={SORT_BY.ASC}>Order by ascending duration</option>
            <option value={SORT_BY.DESC}>Order by descending duration</option>
          </select>
        </div>
        {
          requestStatus.isLoading && <Loader />
        }
        {
          !requestStatus.isLoading && requestStatus.isError && <Error />
        }
        {
          !requestStatus.isLoading && 
            <ul>
              {
                topTenList.map((elem, index) => (
                    <li key={elem.id}
                        className="hvr-underline-from-left"
                        onClick={() => setSelectedSong({index, ...elem})}
                    >
                      <div className="number">{index+1}</div>
                      <img src={elem.artist.picture_small} alt={elem.artist.name} />
                      <div className="desc">
                        <h4>{elem.title} ({convertToMMSS(elem.duration)})</h4>
                        <small>{elem.artist.name}</small>
                      </div>
                    </li>
                  )
                )
              }
            </ul>
        }
      </div>
      {
        selectedSong && <TrackModal {...selectedSong} closeModal={closeModal}/>
      }
    </div>
  );
}

export default App;
