let pizzaListComponent = new Vue(
    {
        el: '#pizza-list-component',
        data: {
            pizzas:[]
            
        },
        methods: {
            loadData: function () {
                let self = this;
                
                axios.get('/Api/GetPizzas')
                    .then(function (response) {
                        self.pizzas=response.data;
                        console.log(self.pizzas);
                    })
                    .catch(function (error) {
                        alert("ERROR: " + (error.message|error));
                    });
                
            }
        },
        created: function () {
            this.loadData();
        }
    }
)