import { Controller } from "stimulus"
import Turbolinks from 'turbolinks'

// Import uppy
const Uppy = require('@uppy/core')
const XHRUpload = require('@uppy/xhr-upload')
const Dashboard = require('@uppy/dashboard')
const ActiveStorageUpload = require('uppy-activestorage-upload')

class MediaLibraryUploadBtn extends Controller {
  static targets = ['trigger', 'modal']

  initialize () {
    const uppy = Uppy()
    .use(Dashboard, {
      trigger: this.triggerTarget,
      target: this.modalTarget,
    })
    uppy.use(ActiveStorageUpload, {
      directUploadUrl: this.data.get('upload-url')
    })

    uppy.on('complete', (result) => {
      setTimeout(() => {
        Turbolinks.visit(this.data.get('media-library-path'))
      }, 1000)
    })
  }
}

export default MediaLibraryUploadBtn
