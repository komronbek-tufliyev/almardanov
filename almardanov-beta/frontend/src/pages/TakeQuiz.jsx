import {Form, Button, Modal } from 'react-bootstrap';
import { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";


export default function TakeQuiz() {
    // questions of quiz
    const [questions, setQuestions] = useState([]); 
    
    // answer of question of quiz. #==@ [{question: 1, answer: "Answer text"}, {question: 2, answer: "Answer text 2"}] #==@
    const [answer, setAnswer] = useState([]); 
    
    // result of quiz . #==@ {score: 2, total: 5} @==#
    const [result, setResult] = useState({}); 
    
    // show result modal
    const [is_result_show, setIs_result_show] = useState(false); 
    
    // loading state
    const [loading, setLoading] = useState(false); 
    
    // error state
    const [error, setError] = useState(false); 
    
    // error message to show in modal
    const [error_message, setError_message] = useState(""); 
    
    // get quiz id from url
    const { quiz_id } = useParams(); 

    var answers = [];

    const base_url = 'http://127.0.0.1:8000/api/v1';

    // fetch questions from backend
    const fetchQuestions = async () => {
        try {
            setLoading(true);
            const response = await axios.get(`${base_url}/quizzes/${quiz_id}/`);
            console.log(response.data);
            setLoading(false);
            setQuestions(response.data);
        } catch (error) {
            console.log(error);
            setError(true);
            setError_message("Something went wrong. Please try again later.")
            setQuestions([]);
            setLoading(false);
        }
    }

    // send answers to backend
    const send_answers = async () => {
        if (answers.length === 0){
            setError(true);
            setError_message("Please answer at least one question");
            return;
        }else{
            const response = await axios.post(`${base_url}/takequiz/`, {'answers': answers}).then((response) => {
                console.log(response);
                console.log(response.data);
                setResult(response.data);
                setIs_result_show(true);
            }).catch((error) => {
                console.log(error);
                setError(true);
                setError_message("Please answer at least one question");
                setAnswer([]);
                setLoading(false);
            });
        }
        clear_answers();
    }

    // show quiz results
    const show_result = () => {
        console.log("show result");
        return (
            <>
            {is_result_show &&
                <Modal show={is_result_show} onHide={handleClose}
                keyboard={false} >
                    <Modal.Header closeButton>
                        <Modal.Title>Result</Modal.Title>
                    </Modal.Header>
                    <Modal.Body className='text-success'>Your score is {result.score} from {result.total}</Modal.Body>
                    <Modal.Footer>
                        <Button variant="secondary" onClick={handleClose}>
                            Close
                        </Button>
                    </Modal.Footer>
                </Modal>
            }
        </>
        )
    }
    
    // show error modal
    const show_error_modal = (error_message) => {
        return (
            <Modal show={true} onHide={handleClose}
            keyboard={false} >
                <Modal.Header closeButton>
                    <Modal.Title>Error</Modal.Title>
                </Modal.Header>
                <Modal.Body className='text-danger'>{error_message}</Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Close
                    </Button>
                </Modal.Footer>
            </Modal>
        )
    }

    // close modal
    const handleClose = () => {
        setError(false);
        // change modal show to false
        setIs_result_show(false);
        setError_message("");
    }

    // clear all answers. set all radio buttons to unchecked
    const clear_answers = () => {
        answers = [];
        // change all radio buttons to unchecked
        var radios = document.getElementsByName('inlineRadioOptions');
        // var radios = document.getElementsByClassName('radio-btns');
        console.log(radios);
        for (var i = 0, length = radios.length; i < length; i++) {
            if (radios[i].checked) {
                radios[i].checked = false;
                break;
            }
        }

    }

            
    // fetch questions when component mounts
    useEffect(() => {
        fetchQuestions();        
    }, [quiz_id]); // eslint-disable-line react-hooks/exhaustive-deps



    return (
        <div className='container'>
            {loading && <h1>Loading...</h1>}
            {error && show_error_modal(error_message)}
            {result && show_result() }
            <h1 className='text-center my-3 mx-auto'>Take a Quiz</h1>
            { questions.length > 0 ?
                questions.map(q=>(
                    <div key={`wrapper${q.id}`} className='container  my-3 mx-auto'>
                        <h3 key={q.text}>#Savol: {q.text}</h3>
                        <Form key="">
                            <Form.Group aria-required key="form-group" className="mb-3" controlId="formBasicCheckbox" 
                            onChange={(e) => {
                                // if question is already in answers, replace it
                                // else add it to answers
                                console.log("A", answers);
                                if(answers.some(e => e.question === q.text)) {
                                    console.log('Exists');
                                    // update the answer
                                    answers.map(a => {
                                        if(a.question === q.text){
                                            a.answer = e.target.value;
                                        }
                                    })
                                    console.log(answers);
                                }else{
                                    answers.push({question: q.text, answer: e.target.value});
                                    console.log('Does not exist');
                                }
                            }}
                            >
                                {[q.answer1, q.answer2, q.answer3, q.answer4].sort(() => Math.random() - 0.5).map(a => (
                                    <Form.Check key={a} type="radio" label={a} name="inlineRadioOptions" id={a} value={a} required />
                                ))}

                                
                            </Form.Group>
                        </Form>
                    </div>

                )) : <><hr /><p>No questions yet</p></>
            }

            {questions.length > 0 && <>
                    <button type='button' onClick={send_answers} className="col-md-6 btn btn-success mx-auto w-50 mr-2">Show Results</button>
                    <button type='button' onClick={clear_answers} className="col-md-6 btn btn-warning mx-auto w-50 ml-2">Clear All </button>
                </>
            }
            
                
                
        </div>
    )
}

