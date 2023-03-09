import { Pagination } from 'react-bootstrap';

function PaginationPage() {
  const [activePage, setActivePage] = useState(1);

  const handlePageChange = (pageNumber) => {
    setActivePage(pageNumber);
    // Fetch data from backend or update UI
  }

  return (
    <Pagination>
      <Pagination.First onClick={() => handlePageChange(1)} />
      <Pagination.Prev onClick={() => handlePageChange(activePage - 1)} />
      <Pagination.Item onClick={() => handlePageChange(1)} active={activePage === 1}>1</Pagination.Item>
      <Pagination.Item onClick={() => handlePageChange(2)} active={activePage === 2}>2</Pagination.Item>
      <Pagination.Item onClick={() => handlePageChange(3)} active={activePage === 3}>3</Pagination.Item>
      <Pagination.Ellipsis />
      <Pagination.Item onClick={() => handlePageChange(10)} active={activePage === 10}>10</Pagination.Item>
      <Pagination.Next onClick={() => handlePageChange(activePage + 1)} />
      <Pagination.Last onClick={() => handlePageChange(10)} />
    </Pagination>
  );
}

export default PaginationPage;
