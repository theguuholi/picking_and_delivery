import LocationMap from "./location-map";

const PickingsMap = {

    mounted() {
        // mostra o elemento dom
        // console.log(this.el)
        // mostra os elementos inseridos no mapa
        // console.log(this.el.dataset)
        this.map = new LocationMap(this.el, [-23.585289979339343, -46.67357717366849], event => {
            console.log("event third param")
            console.log(event.target.options)
            const storeId = event.target.options.storeId
            this.pushEvent("store-clicked", {store_id: storeId})
        })

        const stores = JSON.parse(this.el.dataset.storePickingList)
        stores.forEach(store => {
            this.map.addMarker(store)
        });

        this.handleEvent("highlight-marker", store => {
            console.log("called highlight-marker")
            console.log(store)
            this.map.highlightMarker(store)
        })

        this.handleEvent("add-marker", store => {
            this.map.addMarker(store)
            this.map.highlightMarker(store)
        })
        // console.log(stores)
    }
}
export default PickingsMap;