import React, { useState } from 'react'
import { Button, Modal, Form } from 'react-bootstrap'
import { useForm } from 'react-hook-form'
import { yupResolver } from '@hookform/resolvers/yup'
import { useNavigate } from 'react-router-dom'
import * as Yup from 'yup'
import Cart from 'src/views/cart/Cart'

export default function ServiceModal(props) {
  const [show, setShow] = useState(false)
  const navigate = useNavigate()

  const handleClose = () => setShow(false)
  const handleShow = () => {
    if (sessionStorage.getItem('id')) {
      setShow(true)
    } else {
      navigate('/login')
    }
  }

  const serviceValidationSchema = Yup.object().shape({
    department: Yup.string().required('Required'),
    employee: Yup.number('Must be number').required('Required'),
    startDate: Yup.date('Invalid Date').required('Required'),
    endDate: Yup.date('Invalid Date')
      .min(Yup.ref('startDate', 'End Date cant be before start date'))
      .required('Required'),
  })

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    mode: 'onChange',
    resolver: yupResolver(serviceValidationSchema),
  })

  const onSubmit = (data) => {
    if (localStorage.getItem('cart')) {
      let newItem = [
        {
          ...data,
          id: props.id,
          service: props.title,
          price: props.price,
          subTotal: data.employee * props.price
        },
      ]
      let newCart = JSON.parse(localStorage.getItem('cart')).concat(newItem)
      localStorage.setItem('cart', JSON.stringify(newCart))
    } else {
      localStorage.setItem(
        'cart',
        JSON.stringify([
          {
            ...data,
            id: props.id,
            service: props.title,
            price: props.price,
            subTotal: data.employee * props.price
          }
        ]),
      )
    }
    alert('Add to cart successfully!')
    window.location.reload()
  }

  return (
    <>
      <Button variant="primary" onClick={handleShow}>
        Add to Cart
      </Button>

      <Modal show={show} onHide={handleClose} backdrop="static" keyboard={false}>
        <Form onSubmit={handleSubmit(onSubmit)}>
          <Modal.Header closeButton>
            <Modal.Title>{props.title}</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form.Group className="mb-3" controlId="department">
              <Form.Label>Department</Form.Label>
              <Form.Select name="department" {...register('department')}>
                <option>HR Management</option>
                <option>Service</option>
                <option>Training</option>
                <option>Internet Security</option>
                <option>Auditor</option>
              </Form.Select>
              {errors.department && <p className="text-danger">{errors.department.message}</p>}
            </Form.Group>

            <Form.Group className="mb-3" controlId="numberEmployees">
              <Form.Label>Number of Employees</Form.Label>
              <Form.Control type="number" name="employee" {...register('employee')} />
              {errors.employee && <p className="text-danger">{errors.employee.message}</p>}
            </Form.Group>

            <Form.Group className="mb-3" controlId="startDate">
              <Form.Label>Start Date</Form.Label>
              <Form.Control type="date" name="startDate" {...register('startDate')} />
              {errors.startDate && <p className="text-danger">{errors.startDate.message}</p>}
            </Form.Group>

            <Form.Group className="mb-3" controlId="endDate">
              <Form.Label>End Date</Form.Label>
              <Form.Control type="date" name="endDate" {...register('endDate')} />
              {errors.endDate && <p className="text-danger">{errors.endDate.message}</p>}
            </Form.Group>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="primary" type="submit">
              Submit
            </Button>
            <Button variant="secondary" onClick={handleClose}>
              Close
            </Button>
          </Modal.Footer>
        </Form>
      </Modal>
    </>
  )
}
