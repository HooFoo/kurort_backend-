import Backend from './backend_resource'

export default Backend.buildResource(this.type, {
  my: { method: 'GET', url: 'points/my' },
  forRect: { method: 'POST', url: 'points/in' }
})
