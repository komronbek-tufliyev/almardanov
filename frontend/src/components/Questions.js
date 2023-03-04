export default function Questions({questions, loading}){
    console.log(questions);
    console.log(loading);
    if (loading){
        return (
            <div className="flex items-center justify-center w-56 h-56 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700">
                <div className="px-3 py-1 text-xs font-medium leading-none text-center text-blue-800 bg-blue-200 rounded-full animate-pulse dark:bg-blue-900 dark:text-blue-200">loading...</div>
            </div>
        )
    }
    return (
        <div>
            <ul className="list-group mb-4">
                {questions.count === 0 && <li className="list-group-item">No questions</li>}
                {questions.map(question => (
                    <li key={question.id} className="list-group-item">
                        {question.text}
                        <br />
                        {question.category}
                        <br />
                        {question.answers.map(answer => (
                            <div key={answer.id}>
                                {answer.text}
                                <br />
                                {answer.is_correct}
                            </div>
                        )
                        )}
                    </li>
                ))}
            </ul>
        </div>
    )
}