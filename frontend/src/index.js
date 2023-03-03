import React from 'react';
import ReactDOM from 'react-dom/client';
import reportWebVitals from './reportWebVitals';
// import './index.css';
import Navbar from './components/Navbar';
import QuizPage from './views/QuizPage';
// import HomePage from './views/HomePage';
// import Carousel from './components/Carousel';
// import Accordion from './components/Accordion';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <Navbar />
    <QuizPage />
    {/* <Carousel /> */}
    {/* <Accordion /> */}
    {/* <HomePage />  */}
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals(console.log);
