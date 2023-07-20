package keeper

import (
	"github.com/cosmos/cosmos-sdk/x/test/types"
)

var _ types.QueryServer = Keeper{}
