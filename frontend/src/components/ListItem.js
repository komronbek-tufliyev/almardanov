export default function ListItem({item, children}){
    return (
        <li>
            {children(item)}
        </li>
    )
}
