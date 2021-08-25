import logo from './logo.svg';
import './App.css';
import {useEffect, useState} from "react";



function App() {
  const [randNum, setRandNum] = useState(0);
  useEffect(() => {
    callBackend().then(() => {})

  },[]);

  async function callBackend() {
    const response = await fetch('/api/', {
      method: 'GET', // *GET, POST, PUT, DELETE, etc.
      mode: 'cors', // no-cors, *cors, same-origin
      cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
      credentials: 'same-origin', // include, *same-origin, omit
      headers: {
        'Content-Type': 'application/json'
      },
      redirect: 'follow', // manual, *follow, error
      referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
    });

    response.json().then((data) => {
      console.log(data);
      setRandNum(data['number'])
    });
  }

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Random number from BACKEND: {randNum}
        </p>
      </header>
    </div>
  );
}

export default App;
