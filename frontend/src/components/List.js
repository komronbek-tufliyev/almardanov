export default function List({items, children}){
    return (
        <ul className="space-y-1">
            {items.map((item, index) => (
                <li key={index}>
                    {children(item)}
                </li>
            ))}
        </ul>
    )
}
