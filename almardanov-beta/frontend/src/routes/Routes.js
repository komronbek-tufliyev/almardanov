import {Routes, Route} from 'react-router-dom';


import QuizPage from '../pages/QuizPage';
import QuestionsPage from '../pages/QuestionsPage';
import HomePage from '../pages/HomePage';
import About from '../pages/About';
import { BrowserRouter } from "react-router-dom";





function AppRouter(){
    return (
        <BrowserRouter>
            <Routes>
                <Route path='/' element={<HomePage/>}>HomaPage</Route>
                <Route path='quizzes' element={<QuizPage/>}>Quizzes</Route> 
                <Route path='questions' element={<QuestionsPage/>}>Questions</Route> 
                <Route path='about' element={<About/>}>About</Route>
            </Routes>
        </BrowserRouter>
    )
}


export default AppRouter;
