export default function NoPage() {

    const _404_page_styles = {
        textAlign: "center",
        marginTop: "20vh",
        fontSize: "3rem",
        color: "red",
    };

    const _404_page_h1_styles = {
        fontSize: "3rem",
        color: "red",
    };


    return (
        <div 
        style={_404_page_styles}
        className="container"
 >
        <h1 style={_404_page_h1_styles} >404 Page Not Found</h1>
        </div>
    );
    }
    