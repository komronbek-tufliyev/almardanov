import Carousel from "../components/Carousel2";

export default function HomePage(){

    const props = [
        {
            image: "https://picsum.photos/400/300",
            title: "First slide label",
            description: "Some representative placeholder content for the first slide.",
        },
        {
            image: "https://picsum.photos/400/300",
            title: "Second slide label",
            description: "Some representative placeholder content for the second slide.",
        },
        {
            image: "https://picsum.photos/400/300",
            title: "Third slide label",
            description: "Some representative placeholder content for the third slide.",
        },        
    ]

    return (
        <>
            <Carousel props={props} />
            <div className="container-fluid">
                <h1 className="text-center">Home Page</h1>
            </div>

        </>
    )
}