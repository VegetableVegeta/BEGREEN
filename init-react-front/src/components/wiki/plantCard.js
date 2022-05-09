import React, {Component} from 'react';

import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import IconButton from '@mui/material/IconButton';
import FavoriteIcon from '@mui/icons-material/Favorite';
import PlantPeriod from './plantPeriod';
import { useNavigate } from 'react-router-dom';

export default function PlantCard(props) {

  const navigate = useNavigate();

  const showPlant = (plant) => {
    navigate(`/plant/${plant.id}`, { state: { id:plant.id, plant:plant }})  // redirect
  }


  // props.data => array with all plants published
  const plants = props.datas

  return plants.map(plant => {

      return (
        <div className="col-3">
         

            <Card key={plant.id} sx={{ maxWidth: 345 }} className="m-1">
              <Button onClick={() => showPlant(plant)}>
                  <CardMedia
                    component="img"
                    height="200"
                    image="https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/plant.png"
                    alt={ plant.name }
                  />
                </Button>
                <CardContent>
                
                  <Typography gutterBottom variant="h5" component="div">
                  { plant.name }
                  </Typography>
                  <Typography variant="body2" color="text.secondary">
                    { plant.latin_name }
                  </Typography>
                </CardContent>
              <CardActions>

                <PlantPeriod PlantPeriod={plant.flowering}/>

                <IconButton aria-label="add to favorites"><FavoriteIcon /></IconButton>
              </CardActions>
            </Card>
          
        </div>
      );

  });




}


// { plant.pictures[0].url }
// <Button variant="primary">Go somewhere