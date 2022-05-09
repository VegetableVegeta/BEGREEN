import { ToastContainer, toast } from 'react-toastify';
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import 'react-toastify/dist/ReactToastify.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import Cards from './pages/Cards';
import Login from './pages/Login';
import Quizzes from './pages/Quizzes';
import Wiki from './pages/Wiki';
import Promotions from './pages/Promotions';
import TestComp from './components/TestComp';
import Plantpage from './pages/PlantPage';
import NewPlant from './pages/NewPlant';
import React from 'react';
import NotFound from './pages/NotFound';
import NewTutor from './pages/NewTutor';
import NewPromo from './pages/NewPromo';
import NewStudent from './pages/NewStudent';
import FooterComp from './components/FooterComp';



function App() {
  const notify = () => toast("Wow so easy!");

  return (
    <div className="App">
     
      <div>
        
        <BrowserRouter>
          <Routes>
            <Route path='/*' element={<NotFound />} />
            <Route path='/wiki' element={<Wiki />} />
            <Route path='/cards' element={<Cards />} />
            <Route path='/quizzes' element={<Quizzes />} />
            <Route path='/promotions' element={<Promotions />} />
            <Route path='/test' element={<TestComp />} />
            <Route path='/plant' element={<Plantpage />} />
            <Route path='/plant/:id' exact element={<Plantpage />} />
            <Route path='/plant/new' exact element={<NewPlant />} />
            <Route path='/newtutor' element={<NewTutor />} />
            <Route path='/newpromotion' element={<NewPromo />} />
            <Route path='/newstudent' element={<NewStudent />} />
          </Routes>
        </BrowserRouter>

      </div>

  
      

      <FooterComp />
    </div>
  );
}

export default App;
