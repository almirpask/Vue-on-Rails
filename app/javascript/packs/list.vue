<template>
  <div>
		
		<table class="table">
			<thead>
				<tr>
					<th @click="prop()">Nome</th>
					<th>Idade</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="contact in contacts" :key="contact.id">
					<td>{{contact.name}}</td>
					<td>{{contact.idade}}</td>
					<td><button class="btn btn-danger" @click="delet(contact.id)">{{contact.id}} - DELETE</button></td>
				</tr>
			</tbody>
		</table>
  </div>
</template>


<script>
import Axios from 'axios'

export default {
	name: 'list',
	
  data: function(){
		return{
			
		}
	},
	props: ['contacts'],
	methods:{
		delet: function(id){
			$.ajax({
				type: "DELETE",
				url: "/api/person/" + id + ".json",
				success: (data) => {
					console.log(data)
					this.$emit('delete', data);
					
				}
      });
			console.log('contato deleteado: '+ id)
		}
	}
  
}
</script>
