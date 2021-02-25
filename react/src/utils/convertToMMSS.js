export default (secs) => `${Math.floor(secs/60).toString().padStart(2, '0')}:${(secs%60).toString().padStart(2, '0')}`;
