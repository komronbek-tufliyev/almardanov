import { ListGroup, ListGroupItem } from "react-bootstrap";

function ListItem({ quiz }) {
    return (
        <ListGroup>
        <ListGroupItem>
            <b>Category:</b> {quiz.category}
        </ListGroupItem>
        <ListGroupItem>
            <b>Quiz:</b> {quiz.name}
        </ListGroupItem>
        </ListGroup>
    );
    }

export default ListItem;

