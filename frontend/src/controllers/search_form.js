import { Controller } from "stimulus"

class SearchForm extends Controller {
  static targets = [ "toggleBtn", "moreFilters" ]

  toggleMoreFilters (e) {
    e.preventDefault()
    this.moreFiltersTarget.classList.toggle('d-none')
  }

  submitForm (e) {
    if (e.key == 'Enter') {
      this.element.submit()
    }
  }
}

export default SearchForm
