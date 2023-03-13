import { Container } from 'react-bootstrap';


export default function Footer(){
    return (
        <>          
            <div className="bg-dark" style={{
                position: 'static',
                bottom: 0, 
                width: '100%',
                padding: '1rem',
                textAlign: 'center',
                color: 'white',
            }}>
                <footer className="footer mt-auto bg-dark">
                    <div className="container">
                        <span className="text-secondary">
                            <Container className="text-center">
                                <span className="text-secondary">© 2023 Quiz App</span>
                            </Container>
                        </span>
                    </div>
                </footer>
            </div>
        </>
    )
}