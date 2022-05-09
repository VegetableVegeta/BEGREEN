import React from 'react';
import NavbarComp from '../components/NavbarComp';
import StudentsComp from '../components/PromotionsComponents/StudentsComp';
import TutorComp from '../components/PromotionsComponents/Tutor.Comp';
import PromotionsComp from '../components/PromotionsComponents/PromotionsComp';
const Promotions = () => {
    return (
        <div>

            <NavbarComp />

            <h1>Promotions</h1>

            <div className="container-fluid mt-5">
                <div className="row">
                    <div className="col-xl-6 "><StudentsComp /></div>
                    <div className="col-xl-6"><PromotionsComp /><TutorComp  /></div>  
                </div>
            </div>
        
        </div>
    );
};

export default Promotions;