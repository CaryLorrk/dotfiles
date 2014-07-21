MAIN = main

SDIR=src
ODIR=obj
BDIR=bin
DDIR=dep
CDIR=cov

SRC=$(wildcard $(SDIR)/*.cpp)
OBJ=$(addprefix $(ODIR)/, $(notdir $(SRC:.cpp=.o)))
DEP=$(addprefix $(DDIR)/, $(notdir $(OBJ:.o=.dep)))
BIN=$(addprefix $(BDIR)/, $(MAIN))
RUN=$(addprefix run-, $(MAIN))

LDFLAGS=
LIBS= -lboost_unit_test_framework

ifeq ($(COV),yes)
	CXXFLAGS+=-g -O0 --coverage
	LDFLAGS+=-fprofile-arcs
	ODIR=$(CDIR)
	BDIR=$(CDIR)

cov: $(RUN)
	gcov -r -p -l -o $(CDIR) $(SDIR)/*
	mv *.gcov $(CDIR)
	

.PHONY : cov
endif

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
	sed -i '1s/^/$(ODIR)\//' $(addprefix $(DDIR)/, $(patsubst %.cpp, %.dep, $(notdir $<)))

clean :
		rm -rf $(ODIR) $(BDIR) $(DDIR) $(CDIR)

run : $(RUN)

$(RUN) : run-% : $(BDIR)/%
	$<

.PHONY : all clean run $(RUN)
