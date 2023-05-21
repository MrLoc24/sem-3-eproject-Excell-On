import React from 'react'
import './Breadcrumb.scss'

export default function Breadcrumb({title}) {
  return (
    <div>
      <div class="intro-section p-5 overlay">
        <h2 class="card-title">{title}</h2>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb justify-content-center bg-transparent">
            <li class="breadcrumb-item">
              <a href="/" class="text-white">
                Home
              </a>
            </li>
            <li class="breadcrumb-item text-white" aria-current="page">
            {title}
            </li>
          </ol>
        </nav>
      </div>
    </div>
  )
}
