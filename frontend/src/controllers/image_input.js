import { Controller } from "stimulus"
import { DirectUpload } from "@rails/activestorage"
import { Api } from '@beehivecms/core/frontend/dist/index.mjs'

export default class extends Controller {
  static targets = ['input', 'progress', 'uploaded', 'uploadedImg']

  connect () {
    if (this.isAttached) {
      this.isEmpty = false
      this.isUploaded = true
    }
  }

  upload () {
    Array.from(this.inputTarget.files).forEach(file => this.doUpload(file))

    // clear the input
    this.inputTarget.value = null
  }

  doUpload (file) {
    this.isEmpty = false
    this.isUploading = true
    const upload = new DirectUpload(file, this.uploadUrl)

    upload.create((error, blob) => {
      if (error) {
        alert('Something went wrong')
      } else {
        const hiddenField = document.createElement('input')
        let _this = this

        hiddenField.setAttribute('type', 'hidden')
        hiddenField.setAttribute('value', blob.signed_id)
        hiddenField.name = this.inputTarget.name
        this.element.appendChild(hiddenField)

        let req = Api.getMedium(blob.id, {
          success: function (resp) {
            _this.uploadedImageUrl = resp.data.attributes.sizes.original
          }
        })

        this.isUploading = false
        this.isUploaded = true
      }
    })
  }

  set isEmpty (value) {
    this._isEmpty = value

    if (value) {
      this.inputTarget.classList.remove('d-none')
    } else {
      this.inputTarget.classList.add('d-none')
    }
  }

  set isUploading (value) {
    this._isUploading = value

    if (value) {
      this.progressTarget.classList.remove('d-none')
    } else {
      this.progressTarget.classList.add('d-none')
    }
  }

  set isUploaded (value) {
    this._isUploaded = value

    if (value) {
      this.uploadedTarget.classList.remove('d-none')
    } else {
      this.uploadedTarget.classList.add('d-none')
    }
  }

  set uploadedImageUrl (value) {
    this.uploadedImgTarget.setAttribute('src', value)
  }

  get isUploading () {
    return this._isUploading
  }

  get isUploaded () {
    return this._isUploaded
  }

  get uploadUrl () {
    return this.data.get('upload-url')
  }

  get isAttached () {
    return this.data.get('attached') == 'true'
  }
}
