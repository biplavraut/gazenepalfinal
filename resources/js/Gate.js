export default class Gate{
 constructor(user){
     this.user = user;
 }

 isSupDev(){
     return this.user.type === 'supdev';
 }
 isDev(){
     return this.user.type === 'dev';
 }
 isSupAdmin(){
     return this.user.type === 'supadmin';
 }
 isAdmin(){
     return this.user.type === 'admin';
 }
 isDev(){
     return this.user.type === 'dev';
 }
 isUser(){
     return this.user.type === 'user';
 }
 isDevOrAdmin(){
     if (this.user.type === 'supdev' || this.user.type === 'dev' || this.user.type === 'supadmin' || this.user.type === 'admin'){
         return true;
     }
 }
 isAuthorized(){
    if (this.user.type === 'supdev' || this.user.type === 'dev' || this.user.type === 'supadmin' || this.user.type === 'admin' || this.user.type === 'editor'){
        return true;
    }
 }

 isSupDevOrDev(){
     if (this.user.type === 'supdev' || this.user.type === 'dev'){
            return true;
     }

 }

}
