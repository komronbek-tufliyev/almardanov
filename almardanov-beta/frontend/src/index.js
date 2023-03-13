import React from 'react';
import ReactDOM from 'react-dom/client';
import reportWebVitals from './reportWebVitals';

import 'bootstrap/dist/css/bootstrap.min.css';
import {Routes, Route} from 'react-router-dom';
import { BrowserRouter } from "react-router-dom";
import { Suspense, lazy } from 'react';


import Navigationbar from './layouts/Navbar';
import './index.css';

const NoPage = lazy(() => import('./pages/NoPage'));
const HomePage = lazy(() => import('./pages/HomePage'));
const QuizPage = lazy(() => import('./pages/QuizPage'));
const QuestionsPage = lazy(() => import('./pages/QuestionsPage'));
const About = lazy(() => import('./pages/About'));
const TakeQuiz = lazy(() => import('./pages/TakeQuiz'));
const Footer = lazy(() => import('./layouts/Footer'));


const get_window_size = () => {
  const width = window.innerWidth
  const height = window.innerHeight
  return {width, height}
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <>
    <Navigationbar/>
    {/* <QuizPage /> */}
    <div style={{
      minHeight: get_window_size().height - 56 - 56,

      // marginTop: '56px',
    }}>
    <Suspense fallback={<div className='container'>Loading ...</div>}>
      <BrowserRouter>
        <Routes>
          <Route path='/' element={<HomePage/>} />
          <Route path='quizzes' element={<QuizPage/>} />
          <Route path='takequiz' element={<TakeQuiz/>} /> 
          {/* // This is the line that is causing the error 'Cannot read property 'id' of undefined */}
          <Route path='takequiz/:id' element={<TakeQuiz/>} />
          <Route path='questions' element={<QuestionsPage/>} />
          <Route path='about' element={<About/>} />
          <Route path='*' element={<NoPage/>} />
        </Routes>
      </BrowserRouter>
    </Suspense>
    </div>
    <Footer/>
  </>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
