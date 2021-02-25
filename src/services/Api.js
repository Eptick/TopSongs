
const Api = (function(){

    const base = 'https://cors-anywhere.herokuapp.com/https://api.deezer.com/'

    function request(method = 'GET', path = 'chart', data = {}) {
        const config = {
            method: method, // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, *cors, same-origin
            headers: {
              'Content-Type': 'application/json'
            },
        }
        if(method === 'POST') config.body =JSON.stringify(data)
        return new Promise((resolve, reject) => {
            try {
                fetch(base + path, config)
                    .then(response => response.json())
                    .then(data => resolve(data))
                    .catch(err => reject({err}));
            } catch (error) {
                reject({ error })
            }
        })
    }
  
    /**
     * According to https://developers.deezer.com/api/explorer
     * urls is https://api.deezer.com/chart/0/tracks
     */
    function getTracks(){
      return new Promise((resolve, reject) => {
          try {
              request("GET", "/chart/0/tracks?limit=10").then(data => resolve(data)).catch(error => reject({error}));
          } catch (error) {
              reject({error})
          }
      })
    }
  
    return {
        getTracks,
    };
  }());

  Object.freeze(Api)

  export default Api;