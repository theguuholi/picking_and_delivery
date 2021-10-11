import LocationMap from "./location-map";

const PickingsMap = {

    mounted() {
        // mostra o elemento dom
        // console.log(this.el)
        // mostra os elementos inseridos no mapa
        // console.log(this.el.dataset)
        this.map = new LocationMap(this.el, [-23.585289979339343, -46.67357717366849], event => {
        })

        const stores = JSON.parse(this.el.dataset.storePickingList)
        stores.forEach(store => {
            this.map.addMarker(store)
        });
        // console.log(stores)
    }
}
export default PickingsMap;