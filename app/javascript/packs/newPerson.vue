<template>
  <div>
    <form role="form">
        <div class="form-group">
            <label for="name" id="name">Nome</label>
            <input name="name" id="name" type="text" v-model="name" class="form-control">

        </div>
        <div class="form-group">
            <label for="idade">Idade</label>
            <input name="idade" id="idade" type="number" class="form-control" v-model="idade">
        </div>
        <div class="form-group">
            <button @click="cadastra_pessoa()" type="button" class="btn btn-primary">Cadastrar</button>
        </div>
    </form>
      
  </div>
</template>

<script>


import Axios from 'axios'
export default {
    name: 'Person',
    props:['teste','contacts'],
    data: function(){
        return {
            name: '',
            idade: '',
            info: {},
            contatos: this.contacts
        }
    },
    methods:{
        cadastra_pessoa: function(){
            self = this
            this.info = {
                name: this.name,
                idade: this.idade
            }
            
            //alert(this.info.name)
            $.post('/api/person.json',{person: this.info}).done((data) => {
              this.$emit('changeList', data)
              this.name = ''
              this.idade = ''  
            })
        }
    }
    
}

</script>



