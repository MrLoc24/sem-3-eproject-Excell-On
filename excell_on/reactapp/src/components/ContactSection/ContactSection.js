import React from 'react'
import './ContactSection.scss';

export default function ContactSection() {
  return (
    <div className="container my-5">
        <div className="d-flex flex-row justify-content-center">
            <div className="col-sm-3">
                <div className="card">
                    <div className="card-body">
                        <h5 className="card-title"><i className="bi bi-headset"></i>Contact Us</h5>
                        <p className="card-text">With supporting text below as a natural lead-in to additional content.
                            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius ut culpa praesentium, </p>
                        <a href="#" className="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <div className="col-sm-3">
                <div className="card">
                    <div className="card-body">
                        <h5 className="card-title"><i className="bi bi-person-circle"></i>Social Media</h5>
                        <p className="card-text">With supporting text below as a natural lead-in to additional content.
                            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius ut culpa praesentium, </p>
                        <p>
                            <i className="bi bi-instagram"></i>
                            <i className="bi bi-facebook"></i>
                            <i className="bi bi-whatsapp"></i>
                            <i className="bi bi-twitter"></i>
                        </p>
                    </div>
                </div>
            </div>

            <div className="col-sm-3">
                <div className="card">
                    <div className="card-body">
                        <h5 className="card-title"><i className="bi bi-telephone-fill"></i>Call Center</h5>
                        <p className="card-text">With supporting text below as a natural lead-in to additional content.
                            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Eius ut culpa praesentium, </p>
                        <p>
                        <h5><i className="bi bi-telephone-forward"></i>: 02384619862</h5>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
)}
