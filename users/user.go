package users

import "time"

// UserType represents the kind of the account.
type UserType string

const (
	// Regular users can use the full API in the spec.
	Regular UserType = "user"

	// Guest users have limited permissions and may not be supported by all home servers.
	Guest UserType = "guest"
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
