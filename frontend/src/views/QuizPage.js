import { useState, useEffect } from "react";
import Questions from "../components/Questions";
import axios from "axios";


export default function QuizPage() {
    const [questions, setQuestions] = useState([]);
    const [loading, setLoading] = useState(true);
    const [currentPage, setCurrentPage] = useState(1);
    const [questionsperpage] = useState(10);

    
    useEffect(() => {
        const fetchQuestions = async()=>{
            setLoading(true);
            const res = await axios.get(`http://127.0.0.1:8000/api/v1/questions/`);
            console.log(res.data['results']);
            if (res.data.count > 0) {
                setQuestions(res.data['results']);
                // map the questions
            }
            else {
                setQuestions([]);
            }
            setLoading(false);
        }
        fetchQuestions();
    }, []);
    
    console.log(questions);

    // Get current posts
    const indexOfLastQuestion = currentPage * questionsperpage;
    const indexOfFirstQuestion = indexOfLastQuestion - questionsperpage;
    const currentQuestions = questions.slice(indexOfFirstQuestion, indexOfLastQuestion);

    return (
        <div className="mt-3">
            <h2 className="text=primary mb-3">
                Question List
            </h2>
            <div>
                <strong>Page {currentPage}</strong>
                <p>Index of last Question {indexOfLastQuestion}</p>
            </div>
            <Questions questions={currentQuestions} loading={loading} />
        </div>
    );
}
