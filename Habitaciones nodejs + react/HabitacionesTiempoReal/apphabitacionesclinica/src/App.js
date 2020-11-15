import React, { useEffect, Component } from 'react';
import logo from './logo.svg';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import axios from 'axios';
import {ButtonToolbar, Modal, ModalBody, ModalFooter, ModalHeader} from 'reactstrap';
import { getQueriesForElement } from '@testing-library/react';

const baseUrl="https://localhost:44390/api/paciente_habitacion";

class App extends Component{
  state={
    habitaciones:[],
    paciente_habitacion:[],
    pacientes:[],
    modalInsertar: false,   
       form:{
        id_paciente: '',
        id_habitacion: '',
        dias: '',
        descripcion: ''
       }    
  }


  
  peticionPost=async()=>{
    delete this.state.form.id;
    this.state.form.id_paciente=parseInt( this.state.form.id_paciente);
    this.state.form.id_habitacion=parseInt( this.state.form.id_habitacion);
    this.state.form.dias=parseInt( this.state.form.dias);
   // this.state.form.id_lote=parseInt( this.state.form.id_lote);
  await axios.post(baseUrl,this.state.form).then(response=>{
    this.modalInsertar();
    this.peticionGet();
  }).catch(error=>{
    console.log(error.message);
  })
}

peticionGet=()=>{
  axios.get(baseUrl).then(response=>{
    this.setState({paciente_habitacion: response.data});
  }).catch(error=>{
    console.log(error.message);
  })
}

modalInsertar=()=>{
  this.setState({modalInsertar: !this.state.modalInsertar});
}

handleChange=async e=>{
  e.persist();
  await this.setState({
    form:{
      ...this.state.form,
      [e.target.name]: e.target.value
    }
  });
  console.log(this.state.form);
}

componentDidMount(){
  this.peticionGet();
  axios.get("https://localhost:44390/api/pacientes").
  then((response)=> {
    console.log(response);
    this.setState({pacientes: response.data});
  
  })
  .catch((error)=>{
    console.log(error);
    
  });

  axios.get("https://localhost:44390/api/habitaciones").
  then((response)=> {
    console.log(response);
    this.setState({habitaciones: response.data});
  
  })
  .catch((error)=>{
    console.log(error);
    
  });
  
}

render(){

  const {form}=this.state;

  return(
    <div className="App" class="container">
      <br></br>
      <h2><strong>HABITACIONES POR CLIENTE</strong></h2>
    <br/><br/>
    <button  className="btn btn-success" onClick={()=>this.modalInsertar()}  >Insertar</button>
    <br/><br/>
    <table className="table-bordered">
      <thead>
        <tr>          
          <th>Cliente</th>
          <th>No habitacion</th>
          <th>Dias de ospedadia</th>
          <th>Descripcion</th>
          <th>Accion</th>
        </tr>
      </thead>
      <tbody>
      {this.state.paciente_habitacion.map(gestor=>{
          return(            
            <tr key={gestor.id}>              
                <td>{gestor.id_paciente}</td>
                <td>{gestor.id_habitacion}</td>
                <td>{gestor.dias}</td>
                <td>{gestor.descripcion}</td>                                
                <td>
                  <button className="btn btn-info">Editar</button> {" "}
                  <button className="btn btn-danger">Eliminar</button>
                </td>                
            </tr> 
             
          )
        })}
      </tbody>
      </table>

      <Modal isOpen={this.state.modalInsertar}> 
         <ModalHeader>Insertar</ModalHeader>
         <ModalBody>
           <div className="form-group">             
             <label>Paciente:</label><br />
             
             <select name="id_paciente" id="id_paciente" className="form-control" onChange={this.handleChange} value={form.id_paciente}>
                   {this.state.pacientes.map(elemento=>{
                     return(
                      
                     <option key={elemento.id_paciente}  value={elemento.id_paciente}>{elemento.nombre_paciente}</option>
                     
                     )
                     })}
               </select>  

             <label>Habitacion:</label><br />
             <select name="id_habitacion" id="id_habitacion" className="form-control" onChange={this.handleChange} value={form.id_habitacion}>
                   {this.state.habitaciones.map(elemento=>{
                     return(
                      
                     <option key={elemento.id_habitacion}  value={elemento.id_habitacion}>{elemento.no_habitacion}</option>
                     
                     )
                     })}
               </select> 
             
             
             <label>Dias de ospedidad:</label><br />
             <input type="number" className="form-control" name="dias" id="dias" onChange={this.handleChange} value={form.dias}/>
             <label>Descripcion:</label><br />
             <input type="text" className="form-control" name="descripcion" id="descripcion" onChange={this.handleChange} value={form.descripcion}/>                         
           </div>
         </ModalBody>
         <ModalFooter>
           <button className="btn btn-primary" onClick={()=>this.peticionPost()}>Insertar</button>{" "}
           <button className="btn btn-warning" onClick={()=>this.modalInsertar()} >Cancelar</button>
         </ModalFooter>
       </Modal> 

    </div>
  )
}

}
export default App;
