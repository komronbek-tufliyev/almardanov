import Navigationbar from "../layouts/Navbar";
import Footer from '../components/Footer';


export default function HomePage(){
    return (
        <>
            <Navigationbar />
            <div className="container mt-5 text-center">HomePage</div>
            <Footer/>
        </>
    )
}