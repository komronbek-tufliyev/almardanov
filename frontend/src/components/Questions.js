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
            <ul className="w-48 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg dark:bg-gray-700 dark:border-gray-600 dark:text-white">
                {questions.count === 0 && <li className="block w-full px-4 py-2 text-white bg-blue-700 border-b border-gray-200 rounded-t-lg cursor-pointer dark:bg-gray-800 dark:border-gray-600">No questions</li>}
                {questions.map(question => (
                    <li key={question.id} className="block w-full px-4 py-2 text-white bg-blue-700 border-b border-gray-200 rounded-t-lg cursor-pointer dark:bg-gray-800 dark:border-gray-600">
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