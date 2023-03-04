export default function NavItem({href, is_active, children}){
    return (
        <li>
            <a href={href} className={`block px-3 py-2 rounded-md ${is_active ? 'bg-sky-500 text-white' : 'bg-slate-50'}`} >
                {children}
            </a>
        </li>
    )
}