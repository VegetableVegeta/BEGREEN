import React, { useEffect, useState } from "react";
import axios from "axios";
import { Container, Table, Navbar, Button} from "react-bootstrap";
import { useNavigate } from 'react-router-dom';
import { NavLink } from "react-router-dom";
import { ToastContainer } from "react-toastify";


function PromotionsComp(){
  
  const navigate = useNavigate();
  const [post, setPost] = useState([])

  useEffect(() => {
    axios.get('http://127.0.0.1:9010/dashboard/listpromotion')
    .then(res => {
      console.log(res);
      setPost(res.data.data)
    })
    .catch(err => {
      console.log(err);
    })
  }, [])

  
  const postDelete = (id, e ) => {
    
    const result = window.confirm('Êtes-vous sûr de vouloir supprimer cette promotion ? ');

    if (result) {
        e.preventDefault();
        axios.delete(`http://127.0.0.1:9010/dashboard/promotion?id=${id}`)
        .then(res => console.log('Deleted !!', res)).catch(err => console.log(err))
        window.location.reload();
    }
    
  }
  
//  applique un filtre en fonction de la promotion id de l'utilisateur 
const  list = post.map((post) => {
   return (
    <tr>
      <td className="liste" data-aos-duration="4000" data-aos="fade-left">{post.title}</td>
      <td className="liste" data-aos-duration="4000" data-aos="fade-right">{post.year}</td>  
      {/* <td className="bouton" data-aos-duration="4000" data-aos="fade-right"><button onClick={(e) => postDelete(post.id, e)} class="noselect edit"><span class='text'></span><span class="icon"><img src="edit.png" alt="plusIcon" className="editIcon" /></span></button></td> */}
      <td className="bouton" data-aos-duration="4000" data-aos="fade-right"><button onClick={(e) => postDelete(post.id, e)} class="noselect delete"><span class='text'></span><span class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"/></svg></span></button></td>
    </tr>
    )
  })

  return (

      <Container fluid className="promotions">
        <Navbar className="nav-table">     
            <Navbar.Brand href="#home">Liste des Promotions</Navbar.Brand>
            <Navbar.Toggle />
            <Navbar.Collapse className="justify-content-end">
              <Navbar.Text>
              <NavLink to="/newpromotion" className="nav-link">
                                
              <img src="plus.png" alt="plusIcon" className="plusIcon" />
                            </NavLink>
              </Navbar.Text>
            </Navbar.Collapse>
        </Navbar>
        <Table className="tutorTable" >
          <thead>
            <tr>
              <th>Nom de la promo</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            {list}
          </tbody>
        </Table>
      </Container>
  )
}
export default PromotionsComp;
