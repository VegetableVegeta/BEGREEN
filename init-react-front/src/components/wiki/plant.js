import React, {Component, useState, useEffect} from 'react'
import { Col, Row, Table, Container } from "react-bootstrap";
import axios from "axios";
import { useNavigate } from 'react-router-dom';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import IconButton from '@mui/material/IconButton';
import FavoriteIcon from '@mui/icons-material/Favorite';
import DeleteIcon from '@mui/icons-material/Delete';
import { Link } from 'react-router-dom';
import PlantCard from "./plantCard";

export default function Plant(props) {
    
    const navigate = useNavigate();
    const plant = props.datas;

    // delete plant request
    const deletePlant = (id) => {
        axios.delete(`http://localhost:9012/dashboard/wiki/plant?id=${id}`)
        .then(res => {
            console.log(res);
            navigate(`/wiki`) // redirect
        })
        .catch(err => {
          console.log(err);
        })
    }

    // update -> redirect to the form with plant data
    const updatePlant = (plant) => {
        console.log('--------- UPDATE METHOD');
        console.log(plant);
        navigate(`/plant/new`, { test: true })
    }


    const update = { 
        pathname: "/plant/new", 
        param1: "coucou" 
      }; 


    return ( 
        <div className="col-3">
            <Card key={ plant.id } sx={{ minWidth: 900 }} className="m-1 p-3">
                <Row>
                    <Col>
                        <CardMedia
                            component="img"
                            height="200"
                            image="https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/plant.png"
                            alt={ plant.name }
                            />
                    </Col>

                    <Col>
                        <Typography gutterBottom variant="h5" component="div">{ plant.name }</Typography>
                        <Typography variant="body2" color="text.secondary">{ plant.latin_name }</Typography>
                        <Typography variant="body2" color="text.secondary">famille : </Typography>
                        <div>
                            <Table>
                                <tbody>
                                    <tr>
                                        <td colSpan={2}>origin : { plant.origin }</td>
                                    </tr>
                                    <tr>
                                        <td>fleuraison : { plant.flowering }</td>
                                        <td>feuillage : { plant.foliage }</td>
                                    </tr>
                                    <tr>
                                        <td>plantation : { plant.plantation_period }</td>
                                        <td>emplacement : { plant.plantation_location }</td>
                                    </tr>
                                </tbody>
                            </Table>
                        </div>
                    </Col> 
                </Row>
                
                <CardContent>
                    <Typography gutterBottom variant="" component="div">{ plant.description }</Typography>
                    <Typography gutterBottom variant="" component="div">auteur : </Typography>
                </CardContent>

                <CardActions>
        
                    

                    <Button variant="outlined" color="success">
                        <Link to="/plant/new" state={{ status: 'update', data: plant }} className="link">Modifier</Link>
                    </Button>

                    <Button variant="outlined" color="error" startIcon={<DeleteIcon />} onClick={() => deletePlant(plant.id)}>
                        Delete
                    </Button>

                    <IconButton aria-label="add to favorites"><FavoriteIcon /></IconButton>

                </CardActions>
            </Card>
        </div>
    );

}