import Navbar from '../Navbar/Navbar.vue'
import Sidenav from '../Sidenav/Sidenav.vue'
import GMap from '../GMap/GMap.vue'

export default {
  name: 'index',
  components: {
    navbar: Navbar,
    sidenav: Sidenav,
    'g-map': GMap
  }
}
