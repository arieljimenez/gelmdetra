package user

import (
	"github.com/jinzhu/gorm"
)

type User struct {
	Id       uint   `gorm:"primary_key;AUTO_INCREMENT"`
	Name     string `gorm:"not null;type:VARCHAR(64)"`
	Username string `gorm:"index;not null;not empty;unique;type:VARCHAR(64)"`
	UserPass string `gorm:"not null;type:VARCHAR(64)"`
	Guest    bool   `gorm:"not null;default:true;"`
	Member   bool   `gorm:"not null;default:false;"`
	Admin    bool   `gorm:"not null;default:false;"`
	Valid    bool   `gorm:"not null;default:true;"`
}

type Users []*User

func (u *User) newUser(db *gorm.DB) error {
	err := db.Create(u).Error

	return err
}

func getUsers(db *gorm.DB) Users {
	users := Users{}
	db.Find(&users)

	return users
}
