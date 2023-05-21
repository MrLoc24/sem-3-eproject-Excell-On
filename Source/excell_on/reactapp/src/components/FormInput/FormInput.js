import React from 'react'
import './FormInput.scss'

export default function FormInput(props) {
  const {label, name, value, onChange, errorMessage, ...others} = props
  return (
    <div className="form-group">
      <label>{label}</label>
      <input
        className="form-control"
        name={name}
        value={value || ''}
        onChange={onChange}
        {...others}
      />
      <span className='error-message d-none text-danger'>{errorMessage}</span>
    </div>
  )
}
