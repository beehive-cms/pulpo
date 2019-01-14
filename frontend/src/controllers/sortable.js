import { Controller } from "stimulus"
import dragula from 'dragula'
import api from '../lib/api'

class Sortable extends Controller {
  static targets = ["container", "draggable"]

  connect () {
    this.drake = dragula({
      containers: [this.containerTarget],
      direction: this.direction,
      mirrorContainer: this.containerTarget,

      moves: (el, container, handle) => {
        return handle.dataset.target == 'sortable.handle'
      }
    })

    this.drake.on('drop', () => this.onDrop())
  }

  onDrop () {
    // Set timeout as the dragged copy of element is still present in the DOM
    // when user drops it for a few moments.
    setTimeout(() => {
      api.updateOrder(this.model, this.draggableIds)
    }, 300)
  }

  get direction () {
    return this.data.get('direction') || 'vertical'
  }

  get model () {
    return this.data.get('model')
  }

  get draggableIds () {
    return this.draggableTargets.map((d) => {
      return d.dataset.id
    })
  }
}

export default Sortable
