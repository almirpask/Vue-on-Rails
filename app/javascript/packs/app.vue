<template>
  <div>
    <div class="row">
      <h1 class="page-header">Vue on Rails</h1>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div @click="atualizaLista(teste)" class="panel-heading">
            Formulario Vue on Rails
          </div>
          <div class="panel-body">
            <div class="row">
              <div class="col-lg-6">
                <Person :contacts="contacts" v-on:changeList="atualizaLista($event)"></Person>
                <List :contacts="contacts" v-on:delete="deletaContato($event)"></List>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>  
</template>
<script>
import Person from './newPerson.vue'
import List from './list'

export default {
  data: function () {
    return {
      contacts: ''
    }
  },
  mounted: function(){
		//let self = this
		$.get('/api/person.json', function(data){

		}).done((data) => {
      //self.contacts = data
      this.contacts = data
      console.log('====================================');
      console.log(this.contacts)
      console.log('====================================');
      
		})	
  },
  methods: {
    atualizaLista(parametro){
      let arr = this.contacts.concat(parametro)
      this.contacts = arr;
      //alert(this.contacts)
    },
    deletaContato(person){
      let contato = this.contacts.filter((c)=> {
        return c.id != person.id
      })
      this.contacts = contato;
    }
  },
  components: {
    'Person':Person,
    'List':List
  }

}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
