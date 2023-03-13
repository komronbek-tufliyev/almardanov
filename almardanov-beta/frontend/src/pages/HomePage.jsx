import { Container, } from 'react-bootstrap';
import {
    Carousel,
} from "react-bootstrap";


export default function HomePage() {

    const slide_images_style = {
        height: "500px",
        width: "100%",
        objectFit: "cover",
        objectPosition: "center",
        filter: "brightness(40%)",
    };

    return (
        <>
            <div className="">
                <Carousel>
                    <Carousel.Item>
                        <img
                            className="d-block w-100"
                            src="https://source.unsplash.com/random/1350x566"
                            alt="First slide"
                            style={slide_images_style}
                        />
                        <Carousel.Caption>
                            <h3>First slide label</h3>
                            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                        </Carousel.Caption>
                    </Carousel.Item>
                    <Carousel.Item>
                        <img
                            className="d-block w-100"
                            src="https://source.unsplash.com/random/1350x566"
                            alt="Second slide"
                            style={slide_images_style}
                        />

                        <Carousel.Caption>
                            <h3>Second slide label</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </Carousel.Caption>
                    </Carousel.Item>
                    <Carousel.Item>
                        <img
                            className="d-block w-100"
                            src="https://source.unsplash.com/random/1350x566"
                            alt="Third slide"   
                            style={slide_images_style}        
                        />
                        <Carousel.Caption className=''>
                            <h3>Third slide</h3>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ducimus, dolores!</p>
                        </Carousel.Caption>
                    </Carousel.Item>
                </Carousel>
            </div>
            <div className="mt-5">
                <Container className="">
                    <h1 className='text-center mb-5'>Quiz App</h1>
                    <p>Quiz App is a web application that allows users to create and take quizzes.</p>
                    <p>It is built using the MERN stack.</p>
                    <p>It is a project for the course CS 5610 Web Development at Northeastern University.</p>
                    <p>It is developed by <a href="mailto:komronbek773@gmail.com">Komronbek</a> </p>
                </Container>
            </div>
            
        </>
    )

}