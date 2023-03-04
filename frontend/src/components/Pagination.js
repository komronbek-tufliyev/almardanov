import axios from "axios";
import { useEffect, useState } from "react";
import Questions from "./Questions";



const Pagination = ({ total, limit, page, setPage }) => {
    const [questions, setQuestions] = useState([]);
    const [loading, setLoading] = useState(true);
    const [currentPage, setCurrentPage] = useState(1);
    const [questionsperpage] = useState(10);

    
    useEffect(() => {
        const fetchQuestions = async()=>{
            setLoading(true);
            const res = await axios.get(`http://127.0.0.1:8000/api/v1/questions/`);
            setQuestions(res.data);
            setLoading(false);
        }
        fetchQuestions();
    }, [total, limit]);
    
    console.log(questions);

    // Get current posts
    const indexOfLastPost = currentPage * questionsperpage;

    return (
        <div className="mt-3">
            <h2 className="text=primary mb-3">
                Question List
            </h2>
            <Questions questions={questions} loading={loading} />
        </div>
    );
};
    
export default Pagination;


