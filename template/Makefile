MAIN = main

SDIR=src
ODIR=obj
BDIR=bin
DDIR=dep

SRC=$(wildcard $(SDIR)/*.cpp)
OBJ=$(addprefix $(ODIR)/, $(notdir $(SRC:.cpp=.o)))
DEP=$(addprefix $(DDIR)/, $(notdir $(OBJ:.o=.dep)))
BIN=$(addprefix $(BDIR)/, $(MAIN))
RUN=$(addprefix run-, $(MAIN))

CXXFLAGS=-Wall -Wextra -pedantic -Wshadow -Wpointer-arith -Wcast-qual -Wformat=2 -O2 -std=c++11
LDFLAGS=
LIBS= -lboost_unit_test_framework

all : $(BIN)

-include $(DEP)

$(BIN) : $(BDIR)/% : $(OBJ)
	mkdir -p $(BDIR)
	$(CXX) $(LDFLAGS) $^ $(LIBS) -o $@

$(OBJ) : $(ODIR)/%.o : $(SDIR)/%.cpp
	mkdir -p $(ODIR)
	$(CXX) -c $(CXXFLAGS) $< -o $@
	mkdir -p $(DDIR)
	$(CXX) -MM $< -MF $(addprefix $(DDIR)/, $(patsubst %.cpp, %.dep, $(notdir $<)))
	sed -i 's/1^/$(ODIR)\//' $(addprefix $(DDIR)/, $(patsubst %.cpp, %.dep, $(notdir $<)))

clean :
		rm -rf $(ODIR) $(BDIR) $(DDIR)

run : $(RUN)

$(RUN) : run-% : $(BDIR)/%
	$<

.PHONY : all clean run $(RUN)
