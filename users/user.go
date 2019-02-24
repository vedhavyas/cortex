package users

import "time"

// UserType represents the kind of the account.
type UserType string

const (
	// RegularUser users can use the full API in the spec.
	RegularUser UserType = "user"

	// GuestUser users have limited permissions and may not be supported by all home servers.
	GuestUser UserType = "guest"
)

// User represents single registered user.
type User struct {
	ID        int // id is not MXID but rather local DB unique ID
	Username  string
	Email     string // optional
	Type      UserType
	Active    bool
	CreatedAt time.Time
	UpdatedAt time.Time
}

// NewUser sets the username, email and type and returns a new user
func NewUser(username, email string, userType UserType) User {
	return User{Username: username, Email: email, Type: userType}
}
